# Useful knowledge about SQLite3

## Table of contents 📚

- [Useful knowledge about SQLite3](#useful-knowledge-about-sqlite3)
  - [Table of contents 📚](#table-of-contents-)
  - [Data types 🔤](#data-types-)

## Data types 🔤

SQLite3 has a few data types that are used to define the type of data that can be stored in a table. The data types in SQLite3 are:

1. **NULL**: The value is a NULL value.
2. **INTEGER**: The value is a signed integer, stored in 1, 2, 3, 4, 6, or 8 bytes depending on the magnitude of the value.
3. **REAL**: The value is a floating point value, stored as an 8-byte IEEE floating point number.
4. **TEXT**: The value is a text string, stored using the database encoding (UTF-8, UTF-16BE or UTF-16LE).
5. **BLOB**: The value is a blob of data, stored exactly as it was input.

[Documentation](https://www.sqlite.org/datatype3.html)
