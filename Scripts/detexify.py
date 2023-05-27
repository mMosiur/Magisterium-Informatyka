#%% Imports
import re
from typing import List

#%% Define patterns
# Pattern tuples: (pattern, replacement, is_multiline)
patterns = (
	(r"\r\n", "\n"),
	(r"\\begin{abstract}", r"\\chapter*{Streszczenie}"),
	(r"\\begin{abstract-en}", r"\\chapter*{Abstract}"),
	(r" ?\\cite\{[^{;]+\}\n?", r""),
	(r"\\addcontentsline{\w*}{\w*}{\w*}", r""),
	(r"\\chapter\*?{([\w\s]+)}", r"# \1"),
	(r"\\section\*?{([\w\s]+)}", r"## \1"),
	(r"\\subsection\*?{([\w\s]+)}", r"### \1"),
	(r"^\s|\t+\n?", r""),
	(r"\\begin\{[^{;]+\}(\[.*\])?(\{.*\})?\n?", r""),
	(r"\\end\{[^{;]+\}\n?", r""),
	(r"\\item\n?", r"-"),
	(r"\\[^{;]+\{([^{;]*)\}\n?", r"\1"),
	(r"(``)|('')\n?", r"\""),
	(r"~", r" "),
	(r"--", r"–"),
	(r"\n\n\n", r"\n\n"),
	(r"\n+$", r"\n", True),
)

#%% Define include fetching function
def get_includes_from(filename: str) -> List[str]:
	""" Gets files that are included in given file using \include{<filename>} directive """
	f = open(filename, "r")
	content = f.read()
	f.close()
	return re.findall(r"^\\include\{(.+)\}", content, re.MULTILINE)

#%% Define detexifying function
def detexify(text: str) -> str:
	""" Returns the detexified version of provided text """
	for pattern_replacement in patterns:
		is_multiline = False
		if len(pattern_replacement) == 3:
			pattern, replacement, is_multiline = pattern_replacement
		else:
			pattern, replacement = pattern_replacement
		text = re.sub(pattern, replacement, text, flags=re.MULTILINE if is_multiline else 0)
	return text

#%% Detexify includes from root file
import os
for file in get_includes_from("thesis.tex"):
	f = open(file+".tex", "r")
	content = f.read()
	f.close()
	detexified_file = "detexified_"+file+"_detexified.md"
	os.makedirs(os.path.dirname(detexified_file), exist_ok=True)
	f = open(detexified_file, "w")
	f.write(detexify(content))
	f.close()
