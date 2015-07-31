require 'spec_helper'

describe Mongoid::EmbeddedErrors do

  let(:article) { Article.new }
  let(:invalid_page) { Page.new }
  let(:invalid_section) { Section.new }
  let(:valid_section) { Section.new(header: "My Header") }
  let(:invalid_annotation) { Annotation.new }
  let(:invalid_author) { Author.new }

  describe "errors" do
    let(:blank_error) { [{ error: :blank }] }

    it "bubbles up errors from embedded documents" do
      invalid_page.sections << valid_section
      invalid_page.sections << invalid_section
      article.pages << invalid_page
      article.annotation = invalid_annotation
      article.author = invalid_author

      article.should_not be_valid
      article.errors.details.should eql({
        name: blank_error,
        summary: blank_error,
        :"pages[0].title" => blank_error,
        :"pages[0].sections[1].header" => blank_error,
        :"annotation.text" => blank_error,
        :"author.name" => blank_error
      })
    end

    it "save works as before" do
      article.save.should be_false
      article.should_not be_persisted
      article.errors.details.should eql({
        name: blank_error, summary: blank_error, author: blank_error
      })
    end

    it "handles errors on the main object" do
      article.should_not be_valid
      article.errors.details.should eql({
        name: blank_error, summary: blank_error, author: blank_error
      })
    end

  end

end
