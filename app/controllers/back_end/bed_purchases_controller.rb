class BackEnd::BedPurchasesController < BackEndController
  def index
    @purchases = BedPurchase.all.order(created_at: :desc).limit(50)
  end
end
