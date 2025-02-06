# Nexus Project

Nexus is a modular and flexible platform designed for various applications. This README provides an overview of the project structure and guidelines for development.

## Project Structure

The Nexus project has a specific structure that MUST BE MAINTAINED. Here's an overview of the main directories and their purposes:

```
Nexus/
├── README.md
├── ai/
│   ├── Dockerfile
│   ├── notebooks/
│   ├── requirements.txt
│   ├── setup.py
│   ├── src/
│   │   ├── config/
│   │   ├── data_processing/
│   │   ├── evaluation/
│   │   ├── models/
│   │   ├── training/
│   │   └── utils/
│   └── tests/
├── backend/
│   ├── package.json
│   ├── src/
│   │   ├── api/
│   │   │   ├── controllers/
│   │   │   ├── middlewares/
│   │   │   └── routes/
│   │   ├── app.ts
│   │   ├── config/
│   │   ├── models/
│   │   ├── server.ts
│   │   ├── services/
│   │   ├── types/
│   │   └── utils/
│   ├── tests/
│   │   ├── integration/
│   │   └── unit/
│   └── tsconfig.json
├── docker-compose.yml
├── docs/
│   ├── ai/
│   ├── backend/
│   ├── examples/
│   ├── frontend/
│   ├── infrastructure/
│   ├── project-structure/
│   ├── scripts/
│   └── shared/
├── frontend/
│   ├── package.json
│   ├── public/
│   ├── src/
│   │   ├── App.tsx
│   │   ├── components/
│   │   │   ├── common/
│   │   │   ├── features/
│   │   │   └── layout/
│   │   ├── constants/
│   │   ├── context/
│   │   ├── hooks/
│   │   ├── index.tsx
│   │   ├── pages/
│   │   ├── services/
│   │   ├── styles/
│   │   ├── types/
│   │   └── utils/
│   ├── tests/
│   │   ├── e2e/
│   │   ├── integration/
│   │   └── unit/
│   ├── tsconfig.json
│   └── vite.config.ts
├── infrastructure/
│   ├── docker/
│   ├── kubernetes/
│   └── terraform/
├── scripts/
└── shared/
    ├── constants/
    ├── types/
    └── utils/
```

## Directory Purposes

- `ai/`: Contains AI-related code, models, and utilities.
- `backend/`: Houses the backend server code, API routes, and database models.
- `docs/`: Stores documentation for different parts of the project.
- `frontend/`: Contains the frontend application code, components, and assets.
- `infrastructure/`: Includes configuration files for Docker, Kubernetes, and Terraform.
- `scripts/`: Stores utility scripts for various tasks.
- `shared/`: Contains shared code, types, and utilities used across different parts of the project.

## Development Guidelines

1. **Maintain Structure**: The current project structure MUST BE MAINTAINED. Do not alter the top-level directory structure without team consensus.

2. **Module Development**: When developing new features, place them in the appropriate directory based on their functionality (ai, backend, frontend, etc.).

3. **Documentation**: Update the relevant documentation in the `docs/` directory when adding new features or making significant changes.

4. **Shared Code**: Place any code, types, or utilities that are used across different parts of the project in the `shared/` directory.

5. **Testing**: Write unit tests for your code and place them in the appropriate `tests/` directory within each module.

6. **Infrastructure**: Use the files in the `infrastructure/` directory for deployment and scaling configurations.

## Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/Jeremy-Rich/nexus.git
   cd nexus
   ```

2. Set up the backend:
   ```
   cd backend
   npm install
   npm run dev
   ```

3. Set up the frontend:
   ```
   cd frontend
   npm install
   npm run dev
   ```

4. Set up the AI environment:
   ```
   cd ai
   pip install -r requirements.txt
   ```

5. Refer to specific README files in each directory for more detailed setup instructions.

## Contributing

1. Create a new branch for your feature or bug fix.
2. Make your changes, ensuring they adhere to the project structure and guidelines.
3. Write or update tests as necessary.
4. Update documentation if you're introducing new features or changing existing functionality.
5. 