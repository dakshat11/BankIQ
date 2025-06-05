import pandas as pd
from sqlalchemy import create_engine

engine = create_engine('postgresql://postgres:password@localhost/bankiq')

# Import CSVs
for table in ['customers', 'transactions', 'churn', 'feedback']:
    df = pd.read_csv(f'../data/Database_{table}.csv')
    df.to_sql(table, engine, if_exists='replace', index=False)