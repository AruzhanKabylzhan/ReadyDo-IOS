import SwiftUI

struct ProductDetailView: View {
    let title: String
    // Добавьте другие свойства товара, которые вы хотите отобразить, например, описание, изображение и т. д.

    var body: some View {
        VStack {
            Text("Product Detail: \(title)")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            // Добавьте дополнительные представления для отображения информации о товаре
            // Например:
            /*
            Image("product_image_name") // Замените "product_image_name" на имя изображения товара из Assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)

            Text("Description:")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Описание товара будет здесь...")

            Text("Цена: $10.99")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding(.top, 10)
            */
        }
        .navigationBarTitle(title, displayMode: .inline)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(title: "Sample Product")
    }
}
