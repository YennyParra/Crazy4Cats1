class CatcommentsController < ApplicationController
  before_action :set_catcomment, only: %i[ show edit update destroy ]
  before_action :redirect_si_user_no_coincide_con_creador_del_comment, only: %i[edit update destroy]
  # GET /catcomments or /catcomments.json
  def index
    @catcomments = Catcomment.all
  end

  # GET /catcomments/1 or /catcomments/1.json
  def show
  end

  # GET /catcomments/new
  def new
    @catcomment = Catcomment.new
  end

  # GET /catcomments/1/edit
  def edit
  end

  # POST /catcomments or /catcomments.json
  def create
    @article = Article.find(params[:catcomment][:article_id])
    @catcomment = Catcomment.new(catcomment_params)
    
    if catuser_signed_in?
    @catcomment.catuser = current_catuser
    end
    respond_to do |format|
      if @catcomment.save
        format.html { redirect_to article_path(@article.id), notice: "Catcomment was successfully created." }
        format.json { render :show, status: :created, location: @catcomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catcomments/1 or /catcomments/1.json
  def update
    respond_to do |format|
      if @catcomment.update(catcomment_params)
        format.html { redirect_to catcomment_url(@catcomment), notice: "Catcomment was successfully updated." }
        format.json { render :show, status: :ok, location: @catcomment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catcomments/1 or /catcomments/1.json
  def destroy
    @catcomment.destroy

    respond_to do |format|
      format.html { redirect_to catcomments_url, notice: "Catcomment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catcomment
      @catcomment = Catcomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catcomment_params
      params.require(:catcomment).permit(:content, :article_id, :catuser_id)
    end
end
