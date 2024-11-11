<#
Short Description:
    指定ディレクトリ内のすべてのJPG画像を、指定された範囲にトリミングして保存するPowerShellスクリプト

Long Description:
    このPowerShellスクリプトは、現在のディレクトリ内に存在するすべてのJPGファイルを検索し、
    それぞれに対して特定の範囲でトリミング処理を実行します。
    スクリプトはまず、.jpg拡張子を持つファイル名のリストを取得し、
    リスト内の各ファイルに対してImageMagickのconvertコマンドを使用して、
    922x801ピクセルのサイズで切り取ります。
    切り取りは、画像の左から215ピクセル、上から66ピクセルを開始点とします。
    トリミングされた画像は、元のファイル名に「Final」を追加した新しいファイル名で保存されます。
#>

# JPEGファイル（.jpg）をフルパスではなく名前のみで取得し、$file_listに格納
$file_list = ls -Name *.jpg

# ループで$file_listの各ファイルに処理を行う
for($i=0; $i -lt $file_list.count; $i++) {
    # 新しいファイル名を設定（Outputというフォルダ 元のファイル名）
    $file_new_name = "Output\\" + $file_list[$i]
    
    # ImageMagickを使用して画像を指定された範囲にトリミングし、新しい名前で保存
    # -cropオプション: 768x768サイズにトリミングし、左から256px、上から128pxを開始点とする
    magick convert $file_list[$i] -crop 768x768+256+128 "NewFile\\"$file_new_name
}