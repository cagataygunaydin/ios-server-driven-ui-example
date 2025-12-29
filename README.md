# Server-Driven UI iOS Examples

Example projects demonstrating how to implement Server-Driven UI architecture in iOS.

📖 **Medium Article**: [What is Server-Driven UI?](link)

---

## 1-DynamicContent
<img width="1200" height="675" alt="Adsız tasarım-11" src="https://github.com/user-attachments/assets/bde7cf0e-393a-4acb-8b10-834e7914a79e" />

Building a dynamic CollectionView based on JSON from backend. Section count, item count, and layout type are all determined by JSON.

**Features:**
- Compositional Layout
- Dynamic section/item count
- Different layout types (slider, grid)
- MVVM

**JSON Structure:**
```json
{
  "sections": [
    {
      "id": "featured",
      "title": "Featured",
      "layout": "slider",
      "items": [
        { "id": "1", "title": "Winter Theme" },
        { "id": "2", "title": "Summer Theme" }
      ]
    },
    {
      "id": "popular",
      "title": "Popular",
      "layout": "grid",
      "items": [
        { "id": "3", "title": "Neon Lights" },
        { "id": "4", "title": "Vintage Film" }
      ]
    }
  ]
}
```
---

## 2-DynamicUI
![Adsız tasarım](https://github.com/user-attachments/assets/fcc4e9dc-9ed6-43bc-b0df-76cf8eff82f6)

Dynamically rendering UI elements based on JSON from backend. Same ViewController renders different UI based on `inputType` value.

**Features:**
- Single ViewController, dynamic UI
- Different views based on `inputType`
- MVVM

**JSON Structure:**
```json
{
  "templates": [
    {
      "id": "1",
      "title": "Snow Trend",
      "subtitle": "Create a snowy winter scene",
      "inputType": "text"
    },
    {
      "id": "2",
      "title": "Portrait Style",
      "subtitle": "Transform your photo into art",
      "inputType": "singleImage"
    },
    {
      "id": "3",
      "title": "Couple Transform",
      "subtitle": "Merge two photos together",
      "inputType": "doubleImage"
    }
  ]
}
```

**inputType Values:**
- `text` → Shows TextField
- `singleImage` → Shows 1 image picker
- `doubleImage` → Shows 2 image pickers
