class AnggotaKeluargasController < ApplicationController

  def index
    @q = AnggotaKeluarga.all.includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc, nama_keluarga.id desc").ransack(params[:q])
    @pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
  end

  def pkb
    @q = AnggotaKeluarga.pkb.includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
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
    @q = AnggotaKeluarga.wki.includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
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
    @q = AnggotaKeluarga.pemuda.includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Anggota Pemuda.xlsx"
      }
      format.html { render :pemuda }
    end
  end

  def ulang_tahun_minggu_ini
    @q = AnggotaKeluarga.ulang_tahun(Date.today.beginning_of_week.month,Date.today.end_of_week.month,Date.today.beginning_of_week.day,Date.today.end_of_week.day).includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Ulang Tahun Minggu Ini.xlsx"
      }
      format.html { render :ulang_tahun_minggu_ini }
    end
  end

  def ulang_tahun_minggu_depan
    @q = AnggotaKeluarga.ulang_tahun((Date.today+7).beginning_of_week.month,(Date.today+7).end_of_week.month,(Date.today+7).beginning_of_week.day,(Date.today+7).end_of_week.day).includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Ulang Tahun Minggu Depan.xlsx"
      }
      format.html { render :ulang_tahun_minggu_ini }
    end
  end

end
