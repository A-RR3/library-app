import Book from '../types/book';
import express from 'express';

const bookValidationMiddleware = (req: Book.Request, res: express.Response, next: express.NextFunction) => {
  if (!req.body.title || req.body.title.length < 5) {
    res.status(400).send('Title is required, and should be at least 5 letters long!');
    return;
  }
  if (!req.body.author) {
    res.status(400).send('Author is required');
    return;
  }

  next();
};


export {
  bookValidationMiddleware
}
