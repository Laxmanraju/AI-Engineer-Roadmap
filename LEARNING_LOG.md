# AI Engineer Learning Log

## Long-term goal

Build a Porte AI Financial Assistant:

```text
iOS app → FastAPI backend → database/transaction analysis → LLM tools → FAQ/RAG
```

The assistant should eventually answer both:

- Personal finance questions using structured transaction data
- Porte product/support questions using approved FAQ documents

## Completed

### Python and databases

- Python fundamentals
- SQL and database fundamentals
- SQLite practice
- SQL joins
- Basic database design: tables, primary keys, foreign keys, and relationships

### FastAPI fundamentals

- Creating a FastAPI application
- GET and POST endpoints
- Path parameters
- Request and JSON responses
- HTML pages with Jinja templates
- Static and media file mounting
- HTTP status codes
- Error handling, including custom validation and HTTP error responses
- Pydantic schemas for validating API input and defining API responses

### SQLAlchemy and the blog project

Project: `Projects/fastapi_blog`

- Installed and configured SQLAlchemy
- Created a SQLite database: `blog.db`
- Created a reusable database engine and session dependency
- Created SQLAlchemy models:
  - `User`
  - `Post`
- Defined a one-to-many relationship:
  - One user can have many posts
  - Each post belongs to one user
- Created database tables from the SQLAlchemy models
- Built `POST /api/users`
- Added duplicate username and email checks
- Used Pydantic response models with `from_attributes=True`

## Current work

### FastAPI blog

The User database flow is working.

The Post API still uses an in-memory Python list. Next, replace that temporary list with SQLAlchemy database queries so posts are created, retrieved, updated, and deleted from SQLite.

### Porte AI prototype

Project: `PorteAI_app`

I created an end-to-end prototype:

```text
SwiftUI chat screen
    ↓
POST /chat
    ↓
FastAPI backend
    ↓
Gemini API
    ↓
Response back to iOS
```

Implemented:

- SwiftUI chat interface
- Swift networking with `URLSession` and `async/await`
- FastAPI `/health` endpoint
- FastAPI `POST /chat` endpoint
- Pydantic chat request and response models
- Gemini integration using an environment variable
- `.env` is ignored by Git so the API key is not committed

## Immediate next steps

1. Finish database-backed CRUD for blog posts:
   - Create post in SQLite
   - List posts from SQLite
   - Get one post by ID
   - Update a post
   - Delete a post

2. Continue the FastAPI tutorial topics:
   - Authentication
   - Password hashing
   - Authorization: users can only edit their own posts
   - Testing

3. Improve the Porte AI prototype:
   - Add the Gemini reply to the SwiftUI `messages` array so it appears in the chat UI
   - Add loading and error states
   - Move the backend URL into configuration instead of hard-coding it
   - Keep secrets only in `.env`; never commit them

## Later Porte AI roadmap

1. Replace the general chat demo with mock financial transactions.
2. Build endpoints such as:
   - `GET /transactions`
   - `GET /insights/spending-summary`
   - `GET /insights/category-breakdown`
3. Add authentication and user-specific data.
4. Add LLM tool calling so the model requests transaction summaries rather than receiving raw data.
5. Add FAQ retrieval/RAG with approved Porte documentation.
6. Add production safeguards: logging, tests, rate limits, monitoring, privacy controls, and evaluation.

## Last updated

2026-10-14

Latest work: added SQLAlchemy models and SQLite user persistence to the FastAPI blog; created an iOS → FastAPI → Gemini chat prototype.