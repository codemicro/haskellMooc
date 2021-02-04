import os
import re

excludes = ["index.md", "readme.md"]
suffix = ".md"

header_re = r"^(#+).+$"

info = {}
to_read = []

for root, dirs, files in os.walk(".", topdown=False):
    for name in files:
        test_name = name.lower()
        if test_name not in excludes and test_name[-3:] == suffix:

            if root not in info:
                info[root] = {}
            info[root][name] = []

            to_read.append((root, name))

for fname in to_read:
    with open(os.path.join(*fname), encoding="utf8", errors="ignore") as f:
        matches = re.finditer(header_re, f.read(), re.MULTILINE)
        for matchNum, match in enumerate(matches, start=1):
            spos, epos = match.span()
            info[fname[0]][fname[1]].append(match.string[spos:epos])

for root in info:

    o = "# " + root.strip("." + os.path.sep) + "\n\n"

    for file in info[root]:
        for header in info[root][file]:
            spl = header.split(" ")
            txt = " ".join(spl[1:])
            
            url = "./" + file + "/#" + re.sub(r"[^a-zA-Z0-9 ]", "", txt).lower()
            url = url.replace(" ", "-")

            level = (len(spl[0]) - 1) * 2
            o += (level * " ") + "* [" + txt + "](" + url + ")"
            o += "\n"

    with open(os.path.join(root, "index.md"), "w") as f:
        f.write(o)

mo = "# Haskell MOOC\n\n"

for root in info:

    ru = "." + root.replace(os.path.sep, "/")

    mo += "* [" + root.strip("." + os.path.sep) + "](" + ru + ")\n"

    for file in info[root]:
        for header in info[root][file]:
            spl = header.split(" ")
            txt = " ".join(spl[1:])
            
            url = ru + "/" + file + "/#" + re.sub(r"[^a-zA-Z0-9 ]", "", txt).lower()
            url = url.replace(" ", "-")

            level = (len(spl[0])) * 2
            mo += (level * " ") + "* [" + txt + "](" + url + ")"
            mo += "\n"

with open(os.path.join("listing", "index.md"), "w") as f:
        f.write(mo)
