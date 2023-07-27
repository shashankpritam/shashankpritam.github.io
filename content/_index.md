---
title: "At the Intersection of Genetics and Computation"
---

Hey there, welcome to my little corner of the internet!

---

I'm a computational biologist, currently deep in the world of Ph.D. research. I spend my days (and many nights) exploring the fascinating field of population genetics. This website is my space to share, discuss, and connect over the things that get me thinking.

## My Workspace

### Programming

- **Languages**: Python and R have been my staples for a long time, but I've been immersing myself in the worlds of Go and Codon (an exciting variant of Python).
- **IDEs**: I use RStudio, Jupyter Notebook and VS Codium has been a reliable ally for many other languages.
- **Terminals**: iTerm is my terminal of choice. It's sleek, customizable, and very powerful.
- **Version Control**: Git and GitHub are my tools of choice for version control and collaboration.
- **Shell & Command Line**: I've got a soft spot for Bash, regex, and the simplicity of command-line interfaces.



# My .zshrc Configuration

Here's a look at my `.zshrc` configuration for my Zsh shell setup.

## Theme

I use the `powerlevel10k` theme, which is a fast, highly customizable Zsh theme. 

    ```zsh
    ZSH_THEME="powerlevel10k/powerlevel10k"
    ```

## Case and Hyphen Sensitivity

In this setup, completion in my shell is case-sensitive and hyphen-insensitive.

    ```zsh
    CASE_SENSITIVE="true"
    HYPHEN_INSENSITIVE="true"
    ```

## Plugins

My Zsh comes with the following plugins:

    ```zsh
    plugins=(git zsh-autosuggestions zsh-syntax-highlighting bedtools fig thefuck)
    ```

These plugins enhance my workflow by providing autosuggestions, syntax highlighting, improved Git interaction, and more.

## FZF Integration

FZF, the command-line fuzzy finder, is integrated into my shell. I've also set up some aliases to provide a preview feature for the `ls` command, and to quickly open files in the `micro` editor.

    ```zsh
    alias preview="fzf --preview 'bat --color \"always\" {}'"
    alias vi='micro'
    ```

## Micro Editor

The terminal-based text editor `micro` is set as the default editor in my shell.

    ```zsh
    export EDITOR='micro'
    ```

## Custom Aliases

I've set up custom aliases to streamline my workflow, such as `zshconfig` and `ohmyzsh` for easy access to configuration files, and `hist` to search through my command history using `fzf`.

    ```zsh
    alias zshconfig="micro ~/.zshrc"
    alias ohmyzsh="micro ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"
    alias hist=fzf_history
    ```

## Neofetch

Neofetch runs at the start of each terminal session, displaying system information with ASCII art.

    ```zsh
    neofetch
    ```

## Git Prompt

My prompt also displays information about my Git repository status, like the branch name and whether there are changes to be committed.

    ```zsh
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
    ```

This configuration provides a powerful, user-friendly, and efficient command line environment that boosts my productivity and makes working in the terminal an enjoyable experience. Happy coding!

### Writing

- **Markdown Editor**: Typora is my editor of choice for Markdown. It's clean, it's neat, and it makes writing a breeze.
- **Blogging**: This website is built with Hugo, an open-source static site generator that I adore for its simplicity.
- **Note-Taking**: I rely on Quarto for note-taking and to-do lists. It's versatile and particularly powerful when working with R and has deep integration with Pandoc and LaTex.

## Tools I Can't Live Without

- **Mermaid & D2**: For all my diagram needs. They've made my life a whole lot easier.
- **Termius**: When it comes to remote work, Termius is my best friend. It's a powerful SSH client, and it's saved me more times than I can count.
- **Zotero & Calibre**: My trusted allies in the war against disorganized references and e-books.
- **Pandoc**: The Swiss Army knife of document conversion. I don't know where I'd be without it.

## Eye Care

- **Flux & HazeOver**: These two take care of my eyes during those long hours in front of the screen.

## Github Stars

I've discovered some amazing projects on GitHub, and I've given them a star. You can check them out [here](https://github.com/shashankpritam?tab=stars).

---

Thank you for visiting, and feel free to explore the rest of the site. If you're interested, my latest blog posts are right below, or you can find them in the [Blog](https://www.gomodelbio.systems/blog/) section. 

Happy browsing!
