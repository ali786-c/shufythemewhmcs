const formatPrice = {
        getFormattedPrice: function (price,format) {
            switch (format) {
                case 2:
                    if (price >= 1000) {
                        return price.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2})
                    }
                    return parseFloat(price).toFixed(2)
                case 3:
                    if (price >= 1000) {
                        return price.toLocaleString('de-DE', {minimumFractionDigits: 2, maximumFractionDigits: 2})
                    }
                    return parseFloat(price).toFixed(2).toString().replace('.', ',')
                case 4:
                    return price.toLocaleString('en-US', {minimumFractionDigits: 0, maximumFractionDigits: 0})
                default:
                    return parseFloat(price).toFixed(2);
            }
        }

}

mgJsComponentHandler.addDefaultComponent('mg-one-page-formatPrice', formatPrice);