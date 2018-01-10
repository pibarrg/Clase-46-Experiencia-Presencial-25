class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale= Sale.new(sale_params)

    if params[:Excento_IVA].present? && params[:Excento_IVA]=='on'
      @sale.tax = 0
    else
      @sale.tax = @sale.value * 0.19
    end

    @sale.total = @sale.value + @sale.tax - @sale.discount

    @sale.save
    redirect_to sales_done_path, notice: "la venta ha sido registrada exitosamente"
  end

  def done
    @sales = Sale.all
  end

protected
  def sale_params
    params.require(:sale).permit(:detail, :category, :value, :discount)
  end
end
