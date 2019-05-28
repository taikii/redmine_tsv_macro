Redmine::Plugin.register :redmine_tsv_macro do
  name 'Redmine TSV Macro plugin'
  author 'taikii'
  description 'TSV macro to wiki.'
  version '1.0.0'
  url 'https://github.com/taikii/redmine_tsv_macro'
  author_url 'https://taikii.net/'

  Redmine::WikiFormatting::Macros.register do
    desc "TSV to Table. Example:\n\n" +
    "{{tsv\n" +
    "Value1 Value2  Value3\n" +
    "}}"
    macro :tsv do |obj, args, text|
      out = ''.html_safe
      out << content_tag(:table) do
        concat(content_tag(:tbody) do
          text.each_line {|line|
            concat(content_tag(:tr) do
              line.chomp.split("\t").each {|col|
                concat (content_tag(:td) do
                  concat col
                end)
              }
            end)
          }
        end)
      end
      out
    end

    desc "Heading TSV to Table. Example:\n\n" +
    "{{tsv_h\n" +
    "Head1 Head2  Head3\n" +
    "Value1 Value2  Value3\n" +
    "}}"
    macro :tsv_h do |obj, args, text|
      out = ''.html_safe
      out << content_tag(:table) do
        concat(content_tag(:thead) do
          concat(content_tag(:tr) do
            text.slice!(/.*$/).chomp.split("\t").each {|col|
              concat (content_tag(:th) do
                concat col
              end)
            }
          end)
        end)
        concat(content_tag(:tbody) do
          text.each_line.with_index  {|line, index|
            next if index == 0
            concat(content_tag(:tr) do
              line.chomp.split("\t").each {|col|
                concat (content_tag(:td) do
                  concat col
                end)
              }
            end)
          }
        end)
      end
      out
    end
  end
end
