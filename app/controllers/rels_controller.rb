class RelsController < ApplicationController
  before_action :set_rel, only: [:show, :edit, :update, :destroy]

  # GET /rels
  # GET /rels.json
  def index
    @rels = Rel.all
  end

  # GET /rels/1
  # GET /rels/1.json
  def show
  end

  # GET /rels/new
  def new
    @rel = Rel.new
  end

  # GET /rels/1/edit
  def edit
  end

  # POST /rels
  # POST /rels.json
  def create
    @rel = Rel.new(rel_params)

    respond_to do |format|
      if @rel.save
        format.html { redirect_to @rel, notice: 'Rel was successfully created.' }
        format.json { render :show, status: :created, location: @rel }
      else
        format.html { render :new }
        format.json { render json: @rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rels/1
  # PATCH/PUT /rels/1.json
  def update
    respond_to do |format|
      if @rel.update(rel_params)
        format.html { redirect_to @rel, notice: 'Rel was successfully updated.' }
        format.json { render :show, status: :ok, location: @rel }
      else
        format.html { render :edit }
        format.json { render json: @rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rels/1
  # DELETE /rels/1.json
  def destroy
    @rel.destroy
    respond_to do |format|
      format.html { redirect_to rels_url, notice: 'Rel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rel
      @rel = Rel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rel_params
      params.require(:rel).permit(:rel_type_id, :node1_id, :node2_id)
    end
end
