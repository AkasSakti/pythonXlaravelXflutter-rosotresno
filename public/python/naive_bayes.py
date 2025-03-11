from sqlalchemy import create_engine
from sklearn.preprocessing import LabelEncoder
from sklearn.naive_bayes import GaussianNB
import pandas as pd
import pickle

# Koneksi ke MySQL tanpa password
engine = create_engine("mysql+pymysql://root:@localhost/klasifikasi_cinta")

# Load data dari MySQL
df = pd.read_sql("SELECT * FROM responses", engine)

# Hapus kolom yang tidak relevan dari fitur
df.drop(columns=["id", "user_id", "created_at"], inplace=True, errors='ignore')

# Pisahkan fitur dan label
X = df.drop(columns=["label"])
y = df["label"]

# Encode data
encoders = {}
for col in X.columns:
    le = LabelEncoder()
    X[col] = le.fit_transform(X[col])
    encoders[col] = le  # Simpan encoder untuk digunakan saat prediksi

# Latih model
model = GaussianNB()
model.fit(X, y)

# Simpan model & encoder
with open("C:/laragon/www/klasifikasicinta/public/python/model.pkl", "wb") as f:
    pickle.dump(model, f)

with open("C:/laragon/www/klasifikasicinta/public/python/encoders.pkl", "wb") as f:
    pickle.dump(encoders, f)

print("Model & encoders telah disimpan!")
