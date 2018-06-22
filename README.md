# `consult`: Template for independent consulting proposals

Using Pandoc and LaTeX, this LaTeX template and shell script allows a
small-time independent consultant to write a consulting proposal (Statement of
Work, Retainer Agreement, etc.) as a nice, sane Markdown file and publish it as
a PDF suitable for sending to clients.

You need `pandoc` and `pdflatex` installed on a UNIX-like system to use this
template.

Output includes a simple layout, listing of basic facts of the engagement, and
a pre-filled "sign on the dotted line" acceptance page at the end.

The first eight digits of the MD5 hash of the source file (the result of
`md5sum /path/to/my/sow.md | cut -c -8`) are patched in as a reference number
for the document, helping to keep a bitwise handle on versions of a legally
binding document when preparing an engagement with less organized clients.

## Quickstart

```{bash}
$ rm ./examples/sow.pdf        # Blow away the example output.
$ ./consult ./examples/sow.md  # Build your own!
                               # Have a look at your own ./examples/sow.pdf.
$ git reset --hard             # Get back to where you started.
```

Add this repo to your `${PATH}` or copy `consult` and `consult_template.tex` to
a directory in your `${PATH}` such as `/usr/local/bin`. Then you can run
`consult` from anywhere:

```{bash}
/home/me/engagements/acme_anvils> consult sow.md
```

This publishes the document to `/home/me/engagements/acme_anvils/sow.pdf`.
