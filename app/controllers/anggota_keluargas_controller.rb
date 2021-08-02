class AnggotaKeluargasController < ApplicationController

  def index
    @q = AnggotaKeluarga.all.includes(:nama_keluarga).order(
      "nama_keluarga.kolom asc,  nama_keluarga.id desc").ransack(params[:q])
    @pagy, @anggota_keluargas = pagy(@q.result(distinct: true), items:20)
  end

  def pkb
    @q = AnggotaKeluarga.pkb.includes(:nama_keluarga).order("nama_keluarga.kolom asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: true),items:20)
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
    @anggota_keluargas = AnggotaKeluarga.wki.includes(:nama_keluarga).order("nama_keluarga.kolom asc")
    @pagy, @anggota_keluargas = pagy(@q.result(distinct: true),items:20)
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
    @anggota_keluargas = AnggotaKeluarga.pemuda.includes(:nama_keluarga).order("nama_keluarga.kolom asc")
      @pagy, @anggota_keluargas = pagy(@q.result(distinct: true),items:20)
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
