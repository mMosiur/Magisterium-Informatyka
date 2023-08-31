#%% Imports
import re
from typing import List

#%% Define patterns
# Pattern tuples: (pattern, replacement, is_multiline)
patterns = (
	(r"\r\n", "\n"),
	(r"^%.*\n", r"", re.MULTILINE),
	(r"\\begin{abstract}", r"\\chapter*{Streszczenie}"),
	(r"\\begin{abstract-en}", r"\\chapter*{Abstract}"),
	(r"\\begin{figure}.*?\\end{figure}", r"", re.DOTALL),
	(r"\\begin\{table\}.*?\\end\{table\}", r"", re.DOTALL),
	(r"\\begin{lstlisting}\[language={\[Sharp\]C}\]", r"```csharp"),
	(r"\\end{lstlisting}", r"```"),
	(r"\\lstinline{([^{;]+)}", r"`\1`"),
	(r"\\label{.*}", r""),
	(r" ?\\cite\{[^{;]+\}\n?", r""),
	(r"\\addcontentsline\{.*\}\{.*\}\{.*\}", r""),
	(r"\\chapter\*?{(.+)}", r"# \1"),
	(r"\\section\*?{(.+)}", r"## \1"),
	(r"\\subsection\*?{(.+)}", r"### \1"),
	(r"\\begin\{[^{;]+\}(\[.*\])?(\{.*\})?\n?", r""),
	(r"\\end\{[^{;]+\}\n?", r""),
	(r"^ {0,2}\\item\n?", r"-", re.MULTILINE),
	(r"^ {3,}\\item\n?", r"  -", re.MULTILINE),
	(r" *\\ref\*?\{.*?\}", r""),
	(r"\\hyperref\[[^\]]+\]{(.*?) *}", r"\1"),
	(r" \\times ", r" x "),
	(r"\\\w+\*?\{([^{;]*)\}\n?", r"\1"),
	(r"((?<!`)``(?!`))|('')", r'"'),
	(r"~", r" "),
	(r"--", r"–"),
	(r"\\%", r"%"),
	(r"\n +-", r"\n-"),
	(r"\n   +", r"\n  "),
	(r"\\#", r"#"),
	(r"\n\n\n", r"\n\n"),
	(r"\$([^\$]+)\$", r"`\1`"),
	(r"^\\[\[\]P]$", r"```", re.MULTILINE),
	(r"```\n```\n", r""),
	(r"   +", r"  "),
	(r"(\S)\s+\.$", r"\1.", re.MULTILINE),
	(r"\n+$", r"\n", re.MULTILINE),
)

#%% Define include fetching function
def get_includes_from(filename: str) -> List[str]:
	""" Gets files that are included in given file using \include{<filename>} directive """
	f = open(filename, "r", encoding="utf-8")
	content = f.read()
	f.close()
	return re.findall(r"^\\include\{(.+)\}", content, re.MULTILINE)

#%% Define detexifying function
def detexify(text: str) -> str:
	""" Returns the detexified version of provided text """
	for pattern_replacement in patterns:
		flags = 0
		if len(pattern_replacement) == 3:
			pattern, replacement, flags = pattern_replacement
		else:
			pattern, replacement = pattern_replacement
		text = re.sub(pattern, replacement, text, flags=flags)
	return text

#%% Detexify includes from root file
import os
for file in get_includes_from("thesis-twosided.tex"):
	f = open(file+".tex", "r", encoding="utf-8")
	content = f.read()
	f.close()
	detexified_file = "detexified_"+file+".md"
	os.makedirs(os.path.dirname(detexified_file), exist_ok=True)
	f = open(detexified_file, "w", encoding="utf-8")
	f.write(detexify(content))
	f.close()
