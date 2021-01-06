(TeX-add-style-hook
 "paperFLAIRS2020-V2"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("url" "hyphens") ("rotating" "figuresright") ("todonotes" "colorinlistoftodos") ("algorithm2e" "english" "algo2e" "algoruled" "vlined" "linesnumbered")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "aaai20"
    "times"
    "helvet"
    "courier"
    "url"
    "graphicx"
    "amssymb"
    "amsmath"
    "bm"
    "graphics"
    "adjustbox"
    "tikz"
    "subfigure"
    "epstopdf"
    "siunitx"
    "rotating"
    "todonotes"
    "algorithm2e"
    "enumerate"
    "easyReview")
   (TeX-add-symbols
    "argmin"
    "year"
    "UrlFont")
   (LaTeX-add-labels
    "sec:introduction"
    "sec:Literature"
    "sec:SystemArchitecture"
    "sec:DetailedDesign"
    "sec:RealTimeComputerExperiment"
    "sec:conclusion")
   (LaTeX-add-environments
    "assumption"))
 :latex)

