import yaml
import pandas as pd
import os

folder_path = r"C:\Users\HP\OneDrive\Desktop\pd\data_file"

all_records = []

for root, dirs, files in os.walk(folder_path):    # ----  Read ALL YAML files
    for file in files:
        full_path = os.path.join(root, file)

        with open(full_path, "r") as f:
            day_data = yaml.safe_load(f)

            
            if isinstance(day_data, list):
                all_records.extend(day_data)


df = pd.DataFrame(all_records)   # ----  Convert all YAML data into DataFrame


df = df[['Ticker', 'close', 'date']]   # Keep required columns


output_path = r"C:\Users\HP\OneDrive\Desktop\pd\output_csv"  # ---- Create Output Folder
os.makedirs(output_path, exist_ok=True)


for ticker, part_df in df.groupby('Ticker'):     # --- Create one CSV per Ticke
    part_df.to_csv(f"{output_path}/{ticker}.csv", index=False)

print(" 50 CSV files created successfully!")












