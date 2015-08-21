#!/usr/bin/env pike
/*
  Author: Pontus Östlund <https://profiles.google.com/poppanator>

  Permission to copy, modify, and distribute this source for any legal
  purpose granted as long as my name is still attached to it. More
  specifically, the GPL, LGPL and MPL licenses apply to this software.
*/

private string source_path;
private string destination_path;

private multiset(string) skip_dir = (< "__build__", ".git" >);

private Parser.HTML parser;

private string template;

private mapping replacements = ([
  "title": 0,
  "data": 0,
  "build_date": 0
]);

int main(int argc, array(string) argv)
{
#if !constant(Markdown)
  werror("Missing Markdown module. It's available at %s\n",
         "https://github.com/poppa/Pike-Modules/tree/master/Markdown.pmod");
  return 1;
#endif

  parser = Parser.HTML();
  parser->add_containers(([
    "h1" : lambda (Parser.HTML pp, mapping attr, string data) {
      if (!replacements->title)
        replacements->title = data;
    },

    "a" : lambda (Parser.HTML pp, mapping attr, string data) {
      if (!attr->href) return 0;
      if (sscanf (attr->href, "%*s.md")) {
        attr->href = replace(attr->href, ".md", ".html");

        return ({ sprintf("<a%{ %s=\"%s\"%}>%s</a>",
                  (array) attr, data) });
      }
    }
  ]));

  template = Stdio.read_file(combine_path(__DIR__, "template", "main.html"));

  replacements->build_date = Calendar.now()->format_mtime();

  Markdown.set_newline(1);

  source_path = combine_path(__DIR__, "..");
  destination_path = combine_path(__DIR__, "pages");

  recurse_dir(source_path, lambda (string path, string name) {
    string new_path = replace(path, source_path, destination_path);

    if (Stdio.is_dir(path)) {
      if (!Stdio.exist(new_path))
        mkdir(new_path);

      return;
    }

    array(string) parts = name/".";

    if (sizeof(parts) > 1 && lower_case(parts[-1]) == "md") {
      write("  * Parsing: %s\n", name);
      string html = Markdown.transform(Stdio.read_file(path));
      string nn = (parts[..<1] * ".") + ".html";

      replacements->data = fix_links(html);

      mapping rr = ([]);
      foreach (indices(replacements), string key) {
        rr["${" + key + "}"] = replacements[key];
      }

      html = replace(template, rr);

      new_path = replace(new_path, name, nn);
      Stdio.write_file(new_path, html);
    }
  });

	return 0;
}

string fix_links(string s)
{
  replacements->title = 0;
  return parser->feed(s)->finish()->read();
}

void recurse_dir(string path, function cb)
{
  write("\nScanning: %s\n", path);

  foreach (get_dir(path), string p) {
    string fp = combine_path(path, p);
    cb(fp, p);

    if (Stdio.is_dir(fp) && !skip_dir[p]) {
      recurse_dir(fp, cb);
    }
  }
}