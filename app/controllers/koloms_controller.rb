class KolomsController < ApplicationController
  def index
    @koloms = Kolom.all.order('nama::integer ASC')
  end

  def new
    @kolom = Kolom.new
  end

  def edit

  end

  def create
    @kolom = Kolom.new(kolom_params)
      if @kolom.save
      	redirect_to koloms_path, notice: 'Kolom berhasil dibuat'
      else
        render 'new'
      end
  end

  def destroy
    @kolom=Kolom.find(params[:id])
    @kolom.destroy
    flash.notice="Kolom '#{@kolom.nama}' berhasil dihapus"
    redirect_to koloms_path
  end

  private

  def kolom_params
    params.require(:kolom).permit(:nama, :active)
  end
end
