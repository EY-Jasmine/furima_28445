$(function(){
  $('#item-price').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    const data = $('#item-price').val(); // val()でフォームのvalueを取得(数値)
    const productProfit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    const fee = (data - productProfit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('#add-tax-price').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('#profit').html(productProfit)
    $('#profit').val(productProfit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(productProfit == '') {   // もし､計算結果が''なら表示も消す｡
    $('#profit').html('');
    $('#add-tax-price').html('');
    }
  })
})
