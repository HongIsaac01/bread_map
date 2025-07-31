# 원본 CSV가 CP949라 가정
import codecs

with codecs.open(r'C:\Users\ghddm\Desktop\빵 지도\정보 정리\bread_classification_full.csv', 'r', encoding='cp949') as src_file:
    content = src_file.read()

with open('변환된파일_utf8.csv', 'w', encoding='utf-8') as dest_file:
    dest_file.write(content)
