# sow_template

Using Pandoc and LaTeX, this LaTeX template and shell script allows a
small-time independent consultant to write a consulting Statement of Work in
Markdown and publish it as a PDF suitable for sending to clients.

You need `pandoc` and `pdflatex` installed on a UNIX-like system to use this
template.

Output includes a simple layout, listing of basic facts of the engagement, and
a pre-filled "sign on the dotted line" acceptance page at the end.

The first eight digits of the MD5 hash of the source file (the result of
`md5sum /path/to/my/sow.md | cut -c -8`) are patched in as a reference number
for the SOW, helping to keep a handle on versions when preparing an engagement
with less organized clients.

## Usage

Write your Statement of Work in Markdown, following the format and metadata in
`example/sow.md`. Don't worry about filling in `sow_hash`. Then:

```{bash}
~/sow_template> ./publish_sow.sh /path/to/my/sow.md
```

The file `/path/to/my/sow.pdf` is created.

If `publish_sow.sh` and `template_for_sow.tex` are in your `${PATH}`, you can
call the shell script from anywhere:

```{bash}
~/engagements/acme_anvils> publish_sow.sh sow.md
```

This publishes the document to `~/engagements/acme_anvils/sow.pdf`.
