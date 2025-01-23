// Criando a lista de 10 objetos Meal com URLs de imagens acessíveis
import 'package:meals_menu/models/meal.dart';

List<Meal> dummyMeals = [
  Meal(
    id: '1',
    categories: ['c3', 'c1'],
    tittle: 'Vegetable Stir Fry',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Carrot', 'Broccoli', 'Tofu', 'Soy Sauce'],
    steps: ['Chop vegetables', 'Stir fry in a pan', 'Serve'],
    duration: 20,
    complexity: Complexity.medium,
    affordability: Affordability.cheap,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: '2',
    categories: ['c4', 'c8'],
    tittle: 'Avocado Toast',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Bread', 'Avocado', 'Lemon', 'Olive Oil'],
    steps: ['Toast the bread', 'Mash the avocado', 'Spread on toast', 'Serve'],
    duration: 10,
    complexity: Complexity.easy,
    affordability: Affordability.cheap,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: '3',
    categories: ['c5', 'c1'],
    tittle: 'Chicken Caesar Salad',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Chicken', 'Lettuce', 'Croutons', 'Caesar Dressing'],
    steps: [
      'Grill the chicken',
      'Chop the lettuce',
      'Toss with dressing and croutons',
      'Serve'
    ],
    duration: 25,
    complexity: Complexity.medium,
    affordability: Affordability.expensive,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: '4',
    categories: ['c7', 'c8'],
    tittle: 'Fruit Salad',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Apple', 'Banana', 'Orange', 'Strawberries'],
    steps: ['Chop fruits', 'Mix them in a bowl', 'Serve'],
    duration: 10,
    complexity: Complexity.easy,
    affordability: Affordability.cheap,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: '5',
    categories: ['c3', 'c4'],
    tittle: 'Spaghetti Bolognese',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Spaghetti', 'Ground Beef', 'Tomato Sauce', 'Garlic'],
    steps: ['Boil spaghetti', 'Cook ground beef', 'Add sauce and mix'],
    duration: 30,
    complexity: Complexity.medium,
    affordability: Affordability.expensive,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: '6',
    categories: ['c5', 'c6'],
    tittle: 'Oatmeal with Berries',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Oats', 'Almond Milk', 'Blueberries', 'Honey'],
    steps: [
      'Cook oats with almond milk',
      'Top with berries and honey',
      'Serve'
    ],
    duration: 15,
    complexity: Complexity.easy,
    affordability: Affordability.cheap,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: '7',
    categories: ['c2', 'c3'],
    tittle: 'Chickpea Salad',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Chickpeas', 'Cucumber', 'Tomato', 'Olive Oil'],
    steps: [
      'Chop vegetables',
      'Mix with chickpeas',
      'Drizzle with olive oil',
      'Serve'
    ],
    duration: 15,
    complexity: Complexity.easy,
    affordability: Affordability.cheap,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: '8',
    categories: ['c4'],
    tittle: 'Grilled Salmon',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Salmon', 'Garlic', 'Lemon', 'Olive Oil'],
    steps: ['Marinate salmon', 'Grill for 5-7 minutes', 'Serve with lemon'],
    duration: 20,
    complexity: Complexity.easy,
    affordability: Affordability.luxurious,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: '9',
    categories: ['c1', 'c7'],
    tittle: 'Caprese Salad',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Tomato', 'Mozzarella', 'Basil', 'Olive Oil'],
    steps: [
      'Slice tomatoes and mozzarella',
      'Layer with basil leaves',
      'Drizzle with olive oil'
    ],
    duration: 10,
    complexity: Complexity.easy,
    affordability: Affordability.cheap,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: '10',
    categories: ['c8', 'c3'],
    tittle: 'Chicken Wrap',
    imageUrl:
        'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
    ingredients: ['Chicken', 'Lettuce', 'Tortilla', 'Mayonnaise'],
    steps: [
      'Cook chicken',
      'Wrap with lettuce and mayonnaise in tortilla',
      'Serve'
    ],
    duration: 15,
    complexity: Complexity.easy,
    affordability: Affordability.cheap,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
];
