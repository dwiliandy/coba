class Admins::AnggotaKeluargasController < AdminsController
  before_action :set_anggota_keluarga, only: [:set_meninggal]
  def index
    @q = AnggotaKeluarga.where(meninggal: false).includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc, nama_keluarga.id desc").ransack(params[:q])
    @pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Semua Anggota.xlsx"
      }
      format.html { render :index }
    end
  end

  def template
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Template Import Anggota.xlsx"
      }
      format.html { render :index }
    end
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

  def remaja
    @q = AnggotaKeluarga.remaja.includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Anggota Remaja.xlsx"
      }
      format.html { render :remaja }
    end
  end

  def asm
    @q = AnggotaKeluarga.asm.includes(:nama_keluarga).order("nama_keluarga.kolom::integer asc").ransack(params[:q])
		@pagy, @anggota_keluargas = pagy(@q.result(distinct: false),items:20)
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=Anggota Anak Sekolah Minggu.xlsx"
      }
      format.html { render :asm }
    end
  end

  
  def set_meninggal
    @anggota_keluarga.update(tanggal_meninggal: Date.today, meninggal: true)
    if @anggota_keluarga.nama_keluarga.anggota_keluargas.pluck(:meninggal).exclude? false
      @anggota_keluarga.nama_keluarga.update(active: false)
    end
    redirect_to admins_anggota_keluargas_path, notice: 'Data Anggota berhasil Diupdate.' 
  end
  
  private

   def set_anggota_keluarga
    @anggota_keluarga = AnggotaKeluarga.find(params[:id])
   end

end
