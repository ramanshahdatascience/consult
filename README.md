# `consult`: Template for independent consulting deliverables

Using Pandoc and LaTeX, this LaTeX template and shell script allows a
small-time independent consultant to write consulting proposals (Statement of
Work, Retainer Agreement, etc.) and consulting reports as nice, sane Markdown
files and publish them as PDFs suitable for sending to clients.

You need `pandoc` and `pdflatex` installed on a UNIX-like system to use this
template.

Output includes a simple layout, listing of basic facts of the engagement, and
optionally a pre-filled "sign on the dotted line" acceptance page at the end.

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

## Configuration

`consult` uses some crude Pandoc template logic to allow some flexibility
through the YAML metadata at the top of the Markdown document. At the time of
writing, there are no guardrails to ensure that your metadata makes sense, and
Pandoc silently substitutes blanks for necessary but missing metadata, so use
with care.

A Statement of Work by a sole proprietor consultant with an attached acceptance
page, as in `examples/sow.md`, looks like this:

```
---
marketing_name: "Wile E. Coyote"
byline: "Land bird catching"
doc_title: "Statement of Work"
consultant_name: "Wile E. Coyote"
document_date: "17 September 1949"
document_hash:
client_name: Acme Anvils
client_representative: Jebediah Springfield
project_title: "Roadrunner Crushing Proof of Concept"
acceptance_page: true
agreement_text: |
    The parties hereto verify that the terms of this Statement of Work are
    acceptable. The Client Representative verifies that he or she is authorized
    by the Client to execute this agreement on the Client's behalf.
...
```

But some variations can be helpful.

- If Wile E. Coyote incorporated, he could add a `consultant_representative`
  and use `consultant_name` for his corporate name.
- Dropping the acceptance page by setting `acceptance_page: false` or just
  leaving the last two items off takes care of consulting reports or proposals
  where the client has their own contractual process.
- For reports, `consultant_name` and `consultant_representative` can be omitted
  to present more streamlined top matter.
- For projects without titles (such as retainer proposals), `project_title` can
  be omitted to present more streamlined top matter.
- (Coming Soon) If Wile E. Coyote got a corporate logo, he could substitute the
  `marketing_name` and `byline` for a pointer to the logo file.
