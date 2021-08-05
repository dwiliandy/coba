class AnggotaKeluargasImportsController < ApplicationController
  def new
    @anggota_keluargas_import = AnggotaKeluargasImport.new
  end

  def create
    @anggota_keluargas_import = AnggotaKeluargasImport.new(params[:anggota_keluargas_import])
    if @anggota_keluargas_import.save
      redirect_to anggota_keluargas_path, notice: 'Data berhasil di import'
    else
      render :new
    end
  end
end
