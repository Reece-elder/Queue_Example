import React from 'react';
import Card from "react-bootstrap/Card";
import Button from "react-bootstrap/Button";
const Ticket = ({id, title, description, timestamp, status, author}) => {
return (
  <Card>
    <Card.Body>
      <Card.Title>{title}</Card.Title>
      <Card.Text> {description}</Card.Text>
      <Card.Text> {author}</Card.Text>
    </Card.Body>
    <Card.Footer>
      <Button variant="primary" className="m-2">
        Update
      </Button>
      <Button variant="danger" className="m-2">
        Delete
      </Button>
      <small className="text-muted m-2">
        {timestamp}
      </small>
    </Card.Footer>
  </Card>
);
}
export default Ticket;