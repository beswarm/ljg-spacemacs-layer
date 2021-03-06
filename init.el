;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     yaml
     python
     html
     helm
     (auto-completion :variables auto-completion-enable-sort-by-usage t
                      :disabled-for org markdown)
     better-defaults
     emacs-lisp
     osx
     git
     lijigang
     (org :variables
          org-enable-reveal-js-support t
          org-download-screenshot-method "screencapture"
          org-download-image-dir "../images"
          org-download-heading-lvl nil
          org-download-timestamp "")
     (elfeed :variables rmh-elfeed-org-files (list "~/Library/Mobile Documents/com~apple~CloudDocs/org/feeds/ljg-elfeed.org"))
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner "~/Library/Mobile Documents/com~apple~CloudDocs/1-参考/8-Personal/head.png"
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 3))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-molokai
                         monokai
                         molokai
                         dracula
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; 子龙山人的国内镜像源
  (setq configuration-layer--elpa-archives
        '(("melpai-cn" . "http://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "http://elpa.zilongshanren.com/org/")
          ("gnu-cn" . "http://elpa.zilongshanren.com/gnu/")))

  (setq dotspacemacs-configuration-layer-path "~/.spacemacs.d/layers/")

  ;; https://orgmode.org/manual/Installation.html
  ;; 解决 spacemacs 从 elpa 加载 org 和 emacs 自带 org 版本不一致的冲突
  ;; 可以从源下载最新版本的 Org，并指定该版本的路径
  ;; $ cd ~/src/
  ;; $ git clone https://code.orgmode.org/bzg/org-mode.git
  ;; $ cd org-mode/
  ;; $ make autoloads
  (add-to-list 'load-path "~/Library/Mobile Documents/com~apple~CloudDocs/org/org-mode/lisp")


  ;; https://github.com/manateelazycat/
  ;; 大佬不喜欢 melpa, 插件需要保存到本地, 单独为大佬的插件设置一下存放地址
  (add-to-list 'load-path "~/Library/Mobile Documents/com~apple~CloudDocs/org/ljg-packages")

  (require 'insert-translated-name)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  ;;;;;;;;;;;;;;;;;;;;;;;
  ;; org-mode 相关设置 ;;
  ;;;;;;;;;;;;;;;;;;;;;;;

  ;; Since version 0.104, spacemacs uses the org version from the org ELPA
  ;; repository instead of the one shipped with emacs. Then, any org related
  ;; code should not be loaded before dotspacemacs/user-config, otherwise both
  ;; versions will be loaded and will conflict. Because of autoloading, calling
  ;; to org functions will trigger the loading up of the org shipped with emacs
  ;; which will induce conflicts. One way to avoid conflict is to wrap your org
  ;; config code in a with-eval-after-load block like this:
  (with-eval-after-load 'org
    ;; 设置 todo keywords
    (setq org-todo-keywords
          '((sequence "TODO" "HAND" "|" "DONE")))

    ;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
    (setf org-todo-keyword-faces '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
                                   ("HAND" . (:foreground "white" :background "#2E8B57"  :weight bold))
                                   ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))))

    ;; 设置 bullet list
    (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

    ;; 打开 org-indent mode
    (setq org-startup-indented t)

    ;; Let's have pretty source code blocks
    (setq org-edit-src-content-indentation 0
          org-src-tab-acts-natively t
          org-src-fontify-natively t
          org-confirm-babel-evaluate nil
          org-support-shift-select 'always)

    ;; Org archive
    (setq org-archive-location "%s_archive::date-tree")

    (defadvice org-archive-subtree
      (around org-archive-subtree-to-data-tree activate)
      "org-archive-subtree to date-tree"
      (if
          (string= "date-tree"
                  (org-extract-archive-heading
                    (org-get-local-archive-location)))
          (let* ((dct (decode-time (org-current-time)))
                (y (nth 5 dct))
                (m (nth 4 dct))
                (d (nth 3 dct))
                (this-buffer (current-buffer))
                (location (org-get-local-archive-location))
                (afile (org-extract-archive-file location))
                (org-archive-location
                  (format "%s::*** %04d-%02d-%02d %s" afile y m d
                          (format-time-string "%A" (encode-time 0 0 0 d m y)))))
            (message "afile=%s" afile)
            (unless afile
              (error "Invalid `org-archive-location'"))
            (save-excursion
              (switch-to-buffer (find-file-noselect afile))
              ;; (org-datetree-find-year-create y)
              ;; (org-datetree-find-month-create y m)
              ;; (org-datetree-find-day-create y m d)
              (widen)
              (switch-to-buffer this-buffer))
            ad-do-it)
        ad-do-it))

    ;; Agenda clock report parameters

    (setq org-agenda-prefix-format '((agenda . "%t %s ")))
    (setq org-agenda-clockreport-parameter-plist
          '(:link t :maxlevel 6 :fileskip0 t :compact t :narrow 60 :score 0))

    (setq org-agenda-start-on-weekday nil)
    (setq org-agenda-log-mode-items '(clock))
    (setq org-agenda-include-all-todo t)
    (setq org-agenda-time-leading-zero t)
    (setq org-agenda-use-time-grid nil)

    (setq org-agenda-include-diary nil)
    (setq org-agenda-files (list  "/Users/ljg/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org"
                                  "/Users/ljg/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org_archive"))

    (setq org-default-notes-file "/Users/ljg/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org")
    (setq org-refile-targets '("~/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org" :maxlevel . 3))

    ;; 使用 reveal.js 来生成 html 版本的 ppt
    ;; https://opensource.com/article/18/2/how-create-slides-emacs-org-mode-and-revealjs

    (require 'ox-reveal)
    (setq org-reveal-root (concat (expand-file-name "~/Library/Mobile Documents/com~apple~CloudDocs/org/reveal.js")))
    (setq org-reveal-theme "black")
    (setq org-reveal-control t)
    (setq org-reveal-center t)
    (setq org-reveal-progress t)

    ;; 设置快捷键
    (evil-leader/set-key "oc" 'org-capture)
    (evil-leader/set-key "oa" 'org-agenda)
    (evil-leader/set-key "ol" 'org-store-link)
    (evil-leader/set-key "el" 'eval-print-last-sexp)
    (evil-leader/set-key "od" 'org-archive-subtree)

    (evil-leader/set-key "oip" 'org-set-property)
    (evil-leader/set-key "oil" 'org-insert-link)
    (evil-leader/set-key "ois" 'org-time-stamp)
    (evil-leader/set-key "oid" 'org-insert-drawer)
    (evil-leader/set-key "oif" 'org-footnote-action)

    (evil-leader/set-key "oog" (lambda () (interactive) (find-file "~/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org")))
    (evil-leader/set-key "ool" (lambda () (interactive) (find-file "/Users/ljg/.spacemacs.d/layers/lijigang/packages.el")))

    (evil-leader/set-key "oit" 'insert-day-progress)

    (global-set-key (kbd "C--") 'org-table-insert-hline)

    )

  ;;;;;;;;;;;;;;
  ;; 显示相关 ;;
  ;;;;;;;;;;;;;;

  ;; 在状态栏显示时间
  (display-time-mode 1)

  ;; 折叠时不再显示「...」
  (setq org-ellipsis "▼")

  ;; inline image 不用展示实际大小，可以自定义大小显示
  (setq org-image-actual-width nil)

  (global-hl-line-mode -1)
  (setq-default fill-column 72)

  ;; 打开黄金比例模式, 当前使用的窗口所占比例为 0.618
  (golden-ratio-mode)

  ;; 默认把新开的 Window 显示在右侧
  (setq split-height-threshold nil)
  (setq split-width-threshold 0)


  ;; Remove the markup characters, i.e., "/text/" becomes (italized) "text"
  (setq org-hide-emphasis-markers t)

  ;; Turn on visual-line-mode for Org-mode only
  ;; Also install "adaptive-wrap" from elpa
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)

  ;; more useful frame title, that show either a file or a
  ;; buffer name (if the buffer isn't visiting a file)
  (setq frame-title-format
        '("" " 為學日益, 為道日損 - "
          (:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name)) "%b"))))
  ;;;;;;;;;;;;;;
  ;; 导出相关 ;;
  ;;;;;;;;;;;;;;

  ;; 安装 XeLaTeX 是另外一个故事了..
  (setq Tex-command-default "XeLaTeX")


  ;;;;;;;;;;;;;;;;;;
  ;; 文学编程相关 ;;
  ;;;;;;;;;;;;;;;;;;
  ;; Tangle Org files when we save them
  (defun tangle-on-save-org-mode-file()
    (when (string= (message "%s" major-mode) "org-mode")
      (org-babel-tangle)))

  ;; (add-hook 'after-save-hook 'tangle-on-save-org-mode-file)

  ;; Enable the auto-revert mode globally. This is quite useful when you have
  ;; multiple buffers opened that Org-mode can update after tangling.
  ;; All the buffers will be updated with what changed on the disk.
  (global-auto-revert-mode)


  ;;;;;;;;;;;;;;
  ;; 其它杂项 ;;
  ;;;;;;;;;;;;;;

  (setq default-major-mode 'org-mode)

  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8)
  ;; 时间戳使用英文星期
  (setq system-time-locale "C")

  ;; Agenda clock report parameters
  (setq org-agenda-clockreport-parameter-plist
        '(:link t :maxlevel 6 :fileskip0 t :compact t :narrow 60 :score 0))

  (setq org-hierarchical-todo-statistics nil)

  ;; stop emacs asking for confirmation when eval source code
  (setq org-confirm-babel-evaluate nil)

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (emacs-lisp . t)
     (ditaa . t)
     (plantuml . t)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; https://github.com/syl20bnr/spacemacs/issues/4926 ;;
  ;; artist-mode 左键不能画, 状态问题                  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun artist-mode-toggle-emacs-state ()
    (if artist-mode
        (evil-emacs-state)
      (evil-exit-emacs-state)))

  (unless (eq dotspacemacs-editing-style 'emacs)
    (add-hook 'artist-mode-hook #'artist-mode-toggle-emacs-state))

  (global-visual-line-mode 1)

  (setq org-ditaa-jar-path "/Users/ljg/Library/Mobile Documents/com~apple~CloudDocs/org/org-mode/contrib/scripts/ditaa.jar")

  (setq org-plantuml-jar-path
        (expand-file-name "/Users/ljg/Library/Mobile Documents/com~apple~CloudDocs/org/org-resources/plantuml.jar"))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(package-selected-packages
   (quote
    (elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed tao-theme-theme tao-theme posframe yaml-mode chinese-wbim pangu-spacing find-by-pinyin-dired ace-pinyin pinyinlib pyim-wbdict pyim pyim-basedict dired-icon yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data niflheim-theme dracula-theme-theme ox-reveal wttrin xterm-color swiper ivy org-page git mustache simple-httpd ht cnfonts beacon seq reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl unfill mwim helm-company helm-c-yasnippet fuzzy company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete evil-magit smeargle orgit magit-gitflow magit magit-popup ghub let-alist helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit with-editor org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
