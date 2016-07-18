# Captain Z and the Treasure of Castle Island

An example of using pandoc and markdown to create pdf's ready to publish on Amazon's CreateSpace.

This framework is currently built around the creation of a pdf that will stay within the required margins presented by CreateSpace here:

https://www.createspace.com/Products/Book/InteriorPDF.jsp

Another way to say this is that I haven't experimented with 'full bleed' books using this latex based approach (Zia in the Woods was a full bleed book - but it was built in InDesign, and took a lot of manual work).

Practically, the main issue this poses is that if you have images in your book - those images cannot extend to the edges of the page. Instead, the images need to live within the minimum margins presented on the CreateSpace page. 

I don't think this a huge deal with the Captain Z book - as I was expecting to make 1/2 to 1/3 page sized B/W images (see below on image size). If this is a deal breaker, then you will want to experiment with another tool or another technology.

I did see a conversation about how you could copy in an entire pdf page into your latex document. So theoretically, you could create a pdf with the same width and height as one of your book pages - then you could put a full page image in that pdf that extended out of your documents margins.

I haven't figure a way to do that automatically, so I expect it would be a manual process that occurs after the latex file is created.

## Requirements

This setup uses pandoc: http://johnmacfarlane.net/pandoc/ to output the content of the book in various formats (primarily pdf).

As such, it requires _pandoc_ to be installed on your machine. 

For _Mac_, homebrew has an install.

     brew install pandoc

That got most of it working for me.

It also uses Latex. Specifically, the XeLatex engine. I'm not sure if this needs to be installed separate - but my installation of Latex from MacTex had this... I think.

## Content in Markdown

Addition to making a pdf, this book content is also a Jekyll site. So if you publish it on github pages, you will get a cool site:

http://vallandingham.me/captain_z/

Here, the posts inside

    _posts

Can be individual chapters of the book - like what I did in the similarly formatted "Look A Bird!" : https://github.com/vlandham/LookABird/tree/gh-pages/_posts

Or you can just have one _post for the whole book - which is what I did for Captain Z - as the chapters are so numerous and short. 

Posts are expected to be named in the traditional Jekyll style: year-month-day-title.md 

You could try another format supported by Pandoc and Jekyll that isn't Markdown - but I wouldn't recommend it.

### Note on Chapter Titles

Captain Z has no chapter titles. Instead, I used a single '#' to denote a header - and the latex template is setup to automatically number the headers. So, I just get a big number for a chapter title in the final pdf (which is what I wanted cause of how many chapters there are). 

## Running

To create the pdf, simple call:

    make pdf

Your pdf should be in the out/ directory. 

Check out the Makefile for other output options. Some of which have additional requirements to install.

If you hit an error, its probably because of a missing font or Latex package. You will need to modify the latex template to make it work.

## Latex Template

The latex template used for the book can be found in:

     _layouts/pdf-template.txt

Here you can customize to your heart's content. The size of the book and the margins will be something you want to consider - as well as the font and font size. I think the margins look pretty good for the 5.5 x 8.5 book size - but you may disagree. And if you want a different book size, then you probably want different margins. 

I'm using Adobe Garamond Pro - which you may or may not have installed. If not, try changing lines 17 and 18 to just Garamond... Or try a different cooler font!


## Images

Right now, to get images to work in the website and the book, there are a few scripts that run. Just put your images in the img/ directory - and they should get copied over.

### Image Size

It seems best to think of the size of your images in terms of inches - rather then pixels - as that is what the final format will be in...

For this size book, I liked the look of half-page: 3.5" x 3.5" images - and a somewhat smaller format: 3.5"w x 2.5"h . I haven't seen these in print yet - but in the pdf they look good...

