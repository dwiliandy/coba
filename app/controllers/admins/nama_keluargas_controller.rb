class Admins::NamaKeluargasController < AdminsController
  before_action :set_nama_keluarga, except: [:index, :new, :create]

  def index
    @q = NamaKeluarga.where(active:true).order('kolom::integer asc').ransack(params[:q])
		@pagy, @nama_keluargas = pagy(@q.result(distinct: false),items:20) 
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=NamaKeluarga.xlsx"
      }
      format.html { render :index }
    end
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
        @nama_keluarga.daftar_ulang_tahun_pernikahan
      	redirect_to admins_nama_keluargas_path, notice: 'Nama Keluarga berhasil dibuat'
      else
        render 'new'
      end
  end

  def update
    respond_to do |format|
      if @nama_keluarga.update(nama_keluarga_params)
        @nama_keluarga.daftar_ulang_tahun_pernikahan
        format.html { redirect_to admins_nama_keluargas_path, notice: 'Nama Keluarga berhasil Diupdate.' }
        format.json { render :show, status: :ok, location: @nama_keluarga }
      else
        format.html { render :edit }
        format.json { render json: @nama_keluarga.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def nama_keluarga_params
    params.require(:nama_keluarga).permit(
      :nama, :nomor_kartu_keluarga, :kolom, :active, 
      :tanggal_pernikahan, :ulang_tahun_pernikahan_aktif,
      anggota_keluargas_attributes: [
        :id, :nama, :jenis_kelamin, :nik, 
        :tanggal_lahir, :tempat_lahir, 
        :baptis, :sidi, :status_hubungan, :status_perkawinan, :_destroy]
    )
  end

  def set_nama_keluarga
    @nama_keluarga = NamaKeluarga.find(params[:id])
  end
end
