class Admins::DataLainLainsController < AdminsController

  def meninggal_tahun_ini
    @q = AnggotaKeluarga.meninggal_tahun_ini.order("tanggal_meninggal asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Meninggal Tahun Ini.xlsx"
      }
      format.html { render :meninggal_tahun_ini }
    end
  end

  def lahir_tahun_ini
    @q = AnggotaKeluarga.lahir_tahun_ini.order("tanggal_lahir asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Lahir Tahun Ini.xlsx"
      }
      format.html { render :lahir_tahun_ini }
    end
  end

  def ulang_tahun_minggu_ini
    @q = AnggotaKeluarga.ulang_tahun(Date.today.beginning_of_week.month,Date.today.end_of_week.month,Date.today.beginning_of_week.day,Date.today.end_of_week.day).includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)

    @p = NamaKeluarga.ulang_tahun(Date.today.beginning_of_week.month,Date.today.end_of_week.month,Date.today.beginning_of_week.day,Date.today.end_of_week.day).order("kolom::integer asc").ransack(params[:q])
		@pagy, @nama_keluargas = pagy(@p.result(distinct: false),items:20)


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
    
    @p = NamaKeluarga.ulang_tahun((Date.today+7).beginning_of_week.month,(Date.today+7).end_of_week.month,(Date.today+7).beginning_of_week.day,(Date.today+7).end_of_week.day).order("kolom::integer asc").ransack(params[:q])
		@pagy, @nama_keluargas = pagy(@p.result(distinct: false),items:20)

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Ulang Tahun Minggu Depan.xlsx"
      }
      format.html { render :ulang_tahun_minggu_depan }
    end
  end

end
