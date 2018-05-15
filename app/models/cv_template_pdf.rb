require 'render_anywhere'

class CvTemplatePdf
    include RenderAnywhere

    def initialize(cv_template)
        @cv_template = cv_template
    end

    def to_pdf
        kit = PDFKit.new(as_html, page_size: 'A4', print_media_type: true)
        kit.to_file(Rails.root.join('public', 'cv_maker.pdf'))
    end

    def filename
        "cv-maker-#{@cv_template.title.parameterize}-#{Time.zone.now.to_i}.pdf"
    end

    private

    def as_html
        render template: 'frontend/previews/download', layout: 'pdf', locals: { cv_template: @cv_template }
    end
end
