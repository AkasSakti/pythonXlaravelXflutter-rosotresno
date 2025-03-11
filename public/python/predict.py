import sys
import json
import pickle
import pandas as pd
from sklearn.preprocessing import LabelEncoder

# Load model
with open("C:/laragon/www/klasifikasicinta/public/python/model.pkl", "rb") as f:
    model = pickle.load(f)

# Baca input dari STDIN
raw_input = sys.stdin.read().strip()

try:
    # Parsing JSON
    input_data = json.loads(raw_input)

    # Konversi ke DataFrame
    df_input = pd.DataFrame([input_data])

    # Encode data
    label_cols = ['sering_memikirkan', 'cemburu', 'sering_chat', 'mencari_kesempatan', 
                  'frekuensi_nyebut', 'jantung_berdebar', 'sering_menatap', 'gugup',
                  'senyum_saat_dengar_nama', 'membayangkan_masa_depan', 'mudah_memaafkan']

    encoder = LabelEncoder()
    for col in label_cols:
        if col in df_input.columns:
            df_input[col] = encoder.fit_transform(df_input[col])

    # Prediksi
    hasil = model.predict(df_input)
    result = "Jatuh Cinta" if hasil[0] == 1 else "Tidak Jatuh Cinta"

    # Output hanya hasil prediksi
    print(json.dumps({"prediction": result}))

except json.JSONDecodeError as e:
    print(json.dumps({"error": "Format JSON tidak valid!", "detail": str(e)}))
    sys.exit(1)
