erDiagram
    USERS ||--o{ FAVORITES : "a"
    USERS ||--o{ SEARCH_HISTORY : "effectue"
    CARDS ||--o{ FAVORITES : "est dans"
    CARDS ||--|| EMBEDDINGS : "a"

    USERS {
        int user_id PK
        string username
        string email
        string password_hash
        string role
        datetime created_at
    }

    CARDS {
        int card_id PK
        string name
        text description
        string type
        string color
        string rarity
        datetime created_at
        datetime updated_at
    }

    EMBEDDINGS {
        int card_id FK
        vector embedding PK
        datetime generated_at
    }

    FAVORITES {
        int user_id FK
        int card_id FK
        datetime added_at
        primary key (user_id, card_id)
    }

    SEARCH_HISTORY {
        int search_id PK
        int user_id FK
        text query
        datetime searched_at
    }
