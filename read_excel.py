#!/usr/bin/env python3
"""Simple command line tool to read and print excel files

PRINT CONTENT
(for every sheet in the excel):
- sheet_name
- info about the sheet
- first 5 rows of the sheet

EXAMPLE

================================================================================
Sheet: Sheet1


<class 'pandas.core.frame.DataFrame'>
RangeIndex: 1 entries, 0 to 0
Data columns (total 5 columns):
 #   Column  Non-Null Count  Dtype
---  ------  --------------  -----
 0   Col1    1 non-null      object
 1   Col2    1 non-null      object
 2   Col3    1 non-null      object
 3   Col4    1 non-null      object
 4   Col5    1 non-null      object
dtypes: object(5)
memory usage: 168.0+ bytes
None


┌────┬──────────┬────────┬────────┬────────┬────────┐
│    │ Col1     │ Col2   │ Col3   │ Col4   │ Col5   │
├────┼──────────┼────────┼────────┼────────┼────────┤
│  0 │ content1 │ xxx    │ yyy    │ zzz    │ sss    │
└────┴──────────┴────────┴────────┴────────┴────────┘




================================================================================

"""

import argparse
from pathlib import Path

import pandas as pd

BLUE = "\033[44m"
RESET = "\033[0m"


def read_data(file_path_str: str, **kwargs) -> None:
    """Read an excel file and prints the loaded excel

    =========


    """
    file_path = Path(file_path_str)
    sheet_name = kwargs.pop("sheet_name", None)
    header = kwargs.pop("header", 0)
    index_col = kwargs.pop("index_col", None)
    usecols = kwargs.pop("usecols", None)
    skiprows = kwargs.pop("skiprows", 0)
    nrows = kwargs.pop("nrows", 30)
    if not file_path.is_file():
        raise FileNotFoundError(f"File not found: {file_path}")
    elif file_path.suffix == ".xlsx":
        df_dict = pd.read_excel(
            file_path_str,
            sheet_name=sheet_name,
            header=header,
            index_col=index_col,
            usecols=usecols,
            skiprows=skiprows,
            nrows=nrows,
        )
    elif file_path.suffix == ".csv":
        df_dict = pd.read_csv(
            file_path_str,
            header=header,
            index_col=index_col,
            usecols=usecols,
            skiprows=skiprows,
            nrows=nrows,
        )
    else:
        raise ValueError(f"File type not supported: {file_path}")

    if not isinstance(df_dict, dict):
        df_dict = {"sheet": df_dict}

    for sheet_name, sheet_content in df_dict.items():
        print("=" * 80)
        print(BLUE + f"Sheet: {sheet_name}" + RESET)
        print("\n")
        sheet_content.info()
        print("\n")
        # print only 5 columns each time to avoid cluttering the output
        n_rows = 5
        for col_idx in range(0, len(sheet_content.columns), 5):
            print(
                sheet_content.iloc[:n_rows, col_idx : col_idx + 5].to_markdown(
                    tablefmt="simple_grid", numalign="right"
                )
            )
            print("\n")
        print("\n")

        print("=" * 80)
        print("\n\n")


def main():
    """Main function to read an excel file"""
    parser = argparse.ArgumentParser(description="Read an excel file")
    parser.add_argument("file_path_str", help="Path to the excel file")
    parser.add_argument("--sheet_name", help="Name of the sheet to read", default=None)
    parser.add_argument(
        "--header", help="Row number to use as the column names", default=0
    )
    parser.add_argument(
        "--index_col",
        help="Column to use as the row labels of the DataFrame",
        default=None,
    )
    parser.add_argument(
        "--usecols",
        help="Columns to read from the excel file",
        default=None,
        nargs="+",
    )
    parser.add_argument(
        "--skiprows",
        help="Number of rows to skip at the beginning of the file",
        default=0,
    )
    parser.add_argument(
        "--nrows", help="Number of rows to read from the file", default=30
    )
    args = parser.parse_args()

    read_data(**vars(args))


if __name__ == "__main__":
    main()
