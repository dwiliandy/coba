class Admins::KeuangansController < AdminsController

  def index

  end

  private

  def keuangans_params
    params.require(:keuangan).permit(
      :keterangan, :nominal, :tipe)
  end

end
