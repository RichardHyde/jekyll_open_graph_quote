# Jekyll - Open Graph Quote
#
# Richard Hyde
#
#   Input:
#     {% og_quote %}
#   Output:
#     <div class="og-quote">
#       <img class="og-quote-image" src="https://ichef.bbci.co.uk/news/1024/branded_news/5611/live/a9bd78f0-32de-11ef-9af2-d71cdccb00ef.png" alt="Taking inspiration from human skin ligaments, the prototype face can be made to smile" title="Taking inspiration from human skin ligaments, the prototype face can be made to smile" />
#       <div class="og-quote-link">
#         <a href="https://www.bbc.com/news/articles/cedd3208veyo">Faces made of living skin make robots smile</a> - <span class="og-quote-site">BBC News</span>
#        </div>
#       <div class="og-quote-description">
#         Scientists find a way to attach living skin to robot faces for more realistic smiles and expressions.
#       </div>
#     </div>
#
# Create a div containing the open graph data from the pages front matter

module Jekyll
  class OGQuote < Liquid::Tag
    @data = nil

    # def initialize(tag_name, imput, tokens)
    #   super

    #   @data = input
    # end

    def render(context)
      og = context.registers[:page]["og"]
      
      if og
        source = "<div class=\"og-quote\">"
        if og["image"]
          source += "<img class=\"og-quote-image\" src=\"#{og["image"]}\" alt=\"#{og["image_alt"]}\" title=\"#{og["image_alt"]}\" />"
        end
        source += "<div class=\"og-quote-link\"><a href=\"#{og["url"]}\">#{og["title"]}</a> - <span class=\"og-quote-site\">#{og["site_name"]}</span></div>"
        if og["description"]
          source += "<div class=\"og-quote-description\">#{og["description"]}</div>"
        end
        source += "</div><p/>"
        source
      end
    end
  end
end

Liquid::Template.register_tag('og_quote', Jekyll::OGQuote)