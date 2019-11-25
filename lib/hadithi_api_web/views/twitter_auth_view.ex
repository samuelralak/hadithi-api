defmodule HadithiApiWeb.TwitterAuthView do
  use HadithiApiWeb, :view

  def render("access_token.json", _) do
    %{
      data: %{
        oauth_token: "access-NPcudxy0yU5T3tBzho7iCotZ3cnetKwcTIRlX0iwRl0",
        oauth_token_secret: "veNRnAWe6inFuo8o2u8SLLZLjolYDmDP7SzL0YfYI",
        oauth_callback_confirmed: true
      }
    }
  end

  def render("request_token.json", _) do
    %{
      data: %{
        oauth_token: "request-NPcudxy0yU5T3tBzho7iCotZ3cnetKwcTIRlX0iwRl0",
        oauth_token_secret: "veNRnAWe6inFuo8o2u8SLLZLjolYDmDP7SzL0YfYI",
        oauth_callback_confirmed: true
      }
    }
  end
end
