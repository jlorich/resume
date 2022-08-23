#Résumé

This is my resume. It's avaialble as a [PDF](https://github.com/jlorich/resume/blob/master/joseph_lorich_resume.pdf?raw=true) or in the original [LaTeX format](https://github.com/jlorich/resume/blob/master/joseph_lorich_resume.tex).

For more information on LaTeX and how to build the resulting pdfs see the project website [here](http://www.latex-project.org/).

## Compiling
This project uses a [VSCode DevContainer](https://code.visualstudio.com/docs/remote/containers) and leverages lualatex.  To ensure the Tex Workshop VSCode extension works properly, add the following to your settings.json.

```
    "latex-workshop.latex.recipes": [
        {
            "name": "lualatex",
            "tools": [
                "lualatex"
            ]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "lualatex",
            "command": "lualatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        }
    ]
```