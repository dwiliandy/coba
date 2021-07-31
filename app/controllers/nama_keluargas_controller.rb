class NamaKeluargasController < ApplicationController
  before_action :set_nama_keluarga, except: [:index, :new, :create]

  def index
    @nama_keluargas = NamaKeluarga.all
  end

  def new
    @nama_keluarga = NamaKeluarga.new
    @nama_keluarga.anggota_keluargas.build
  end

  def edit

  end

  def create
    @nama_keluarga = NamaKeluarga.new(nama_keluarga_params)

      if @nama_keluarga.save
      	redirect_to nama_keluargas_path, notice: 'Nama Keluarga berhasil dibuat'
      else
        render 'new'
      end
  end

  def update
    respond_to do |format|
      if @nama_keluarga.update(nama_keluarga_params)
        format.html { redirect_to nama_keluargas_path, notice: 'Nama Keluarga berhasil Diupdate.' }
        format.json { render :show, status: :ok, location: @nama_keluarga }
      else
        format.html { render :edit }
        format.json { render json: @nama_keluarga.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @nama_keluarga.destroy
    respond_to do |format|
      format.html { redirect_to nama_keluargas_path, notice: 'Nama Keluarga berhasil Dihapus.' }
      format.json { head :no_content }
    end
  end

  private

  def nama_keluarga_params
    params.require(:nama_keluarga).permit(:nama, :NomorKK, anggota_keluargas_attributes: 
      [:id, :nama, :jenis_kelamin, :nik, 
        :tanggal_lahir, :tempat_lahir, :_destroy])
  end

  def set_nama_keluarga
    @nama_keluarga = NamaKeluarga.find(params[:id])
  end
end