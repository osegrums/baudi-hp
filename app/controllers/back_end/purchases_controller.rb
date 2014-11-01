class BackEnd::PurchasesController < BackEndController
  def index
    @purchases = Purchase.all.order(created_at: :desc).limit(50)
  end
end
