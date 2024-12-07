import express from "express";
import dotenv from "dotenv";
import { errorHandler } from "./utils/middlewares/errorHandler";
import authRoutes from "./modules/auth/routes";
import watchListRoutes from "./modules/watch-list/routes";
const cors = require('cors')


dotenv.config();

export class Server {
  private app: express.Application;
  private port: number;

  constructor(port: number) {
    this.port = port;
    this.app = express();
  }

  private enableMiddlewares() {
    this.app.use(express.json());
    this.app.use(express.urlencoded({ extended: true }));
  }

  public startApp() {
    this.app.use(
      cors({
        origin: "http://localhost:5173",
        methods: ["GET", "POST", "PUT", "DELETE"],
        credentials: true,
      })
    );

    this.enableMiddlewares();
    this.app.use("/auth", authRoutes);
    this.app.use("/watchlist", watchListRoutes);
    this.app.use(errorHandler);

    this.app.listen(this.port, () => {
      console.log(`Server is running on port ${this.port}`);
    });
  }
}
