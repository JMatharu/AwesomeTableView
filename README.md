# Awesome TableView

This project is inspired from [Lea Marolt](https://github.com/leamars) on her speech at [dotSwift 2019](https://www.youtube.com/watch?v=dluKlOPPllY)

## Problems

Problem with Tableview that can be handled easily with Generics, Subscripts, Enums.

1. Eliminate Reusable Identifier
2. Reduce Duplicated UI code
3. Enums as Table View models


## Eliminate Reusable Identifier

### Problem - Register Cell
```swift
tableView.register(AppCellTableViewCell.self, forCellReuseIdentifier: "AppCellTableViewCell")
```
```swift
tableView.register(UINib(nibName: "AppCellTableViewCell", bundle: nil), forCellReuseIdentifier: "AppCellTableViewCell")
```

### Solution

```swift
tableView.registerCellWithNib(AppCellTableViewCell.self)
```

### Problem - Dequeue Reusable Cell
```swift
guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppCellTableViewCell", for: indexPath) as? AppCellTableViewCell else {
return UITableViewCell()
}
```

### Solution

```swift
let cell: AppCellTableViewCell = tableView.dequeueReusableCell(for: indexPath)
```

## Reduce Duplicated UI code 
### Solution - In Progress

## Enums as Table View models

Sample In class
```InitialTableViewController.swift```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)

