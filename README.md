# Redmine TSV Macro Plugin

Convert TSV format to table. 

## Example

```
{{tsv
Value1  Value2  Value3
}}
```

<table>
  <tbody>
    <tr><td>Value1</td><td>Value2</td><td>Value3</td></tr>
  </tbody>
</table>

```
{{tsv_h
Head1 Head2 Head3
Value1  Value2  Value3
}}
```

<table>
  <thead>
    <tr><th>Head1</th><th>Head2</th><th>Head3</th></tr>
  </thead>
  <tbody>
    <tr><td>Value1</td><td>Value2</td><td>Value3</td></tr>
  </tbody>
</table>

## Installation

1. Clone or copy files into the Redmine plugins directory
   ```
   git clone https://github.com/taikii/redmine_tsv_macro.git plugins/redmine_tsv_macro
   ```
2. Restart Redmine

## License

[MIT](LICENSE)
