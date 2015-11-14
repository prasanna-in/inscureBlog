class DocumentsController < ApplicationController

  def upload
    document = create_document(upload_params[:file])
    render json: { document_id: document.id, file_name: document.file_name, file_size: "#{upload_params[:file].size / 1000} mb" }
  end

  def show
    document = Document.find_by(id: params[:id])
    send_data(document.file, filename: document.file_name)
  end

  def destroy
    Document.find_by(id: params[:id]).try(:destroy)
    render json: true
  end

  private

  def create_document(file)
    Document.create(
        file: file.read,
        file_name: file.original_filename,
        mime_type: file.content_type,
        purpose: Document.purposes[:BLOG_ATTACHMENT]
    )
  end

  def upload_params
    params.permit(:file)
  end

end
