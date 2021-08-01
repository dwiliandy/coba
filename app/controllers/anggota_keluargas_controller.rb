class AnggotaKeluargasController < ApplicationController

  def index

  end

  def pkb
    @anggota_keluargas = AnggotaKeluarga.pkb
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Anggota PKB.xlsx"
      }
      format.html { render :pkb }
    end
  end

  def wki
    @anggota_keluargas = AnggotaKeluarga.wki
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Anggota WKI.xlsx"
      }
      format.html { render :wki }
    end
  end

  def pemuda
    @anggota_keluargas = AnggotaKeluarga.pemuda
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Anggota Pemuda.xlsx"
      }
      format.html { render :pemuda }
    end
  end

end
